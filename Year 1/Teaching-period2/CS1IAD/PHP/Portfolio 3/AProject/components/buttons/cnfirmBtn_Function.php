<?php 
if(isset($_POST['cnfimBtn-add'])) {
    // Validate required fields
    $requiredFields = ['title', 'start', 'end', 'phase', 'description'];
    foreach($requiredFields as $field) {
        if(!isset($_POST[$field]) || empty($_POST[$field])) {
            $errors[] = "The '$field' field is required.";
        }
    }

    // If there are validation errors, push them into the $errors array
    if(!empty($errors)) {
        foreach($errors as $error) {
            // Push each error message into the $errors array
            array_push($errors, $error);
        }
    } else {
        // Sanitize user inputs
        $title = mysqli_real_escape_string($db, $_POST['title']);
        $start_date = mysqli_real_escape_string($db, $_POST['start']);
        $end_date = mysqli_real_escape_string($db, $_POST['end']);
        $phase = mysqli_real_escape_string($db, $_POST['phase']);
        $description = mysqli_real_escape_string($db, $_POST['description']);

        // Get the user's ID from the session
        $uname = $_SESSION['username'];
        $uidGet = "SELECT uid FROM users WHERE username = '$uname'";
        $result = mysqli_query($db, $uidGet);
        $row = mysqli_fetch_assoc($result);
        $uid = $row['uid'];

        // Insert project data into the database using prepared statement
        $sqlAdd = "INSERT INTO projects (title, start_date, end_date, phase, description, uid) 
                   VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = mysqli_prepare($db, $sqlAdd);
        mysqli_stmt_bind_param($stmt, 'ssssss', $title, $start_date, $end_date, $phase, $description, $uid);

        if(mysqli_stmt_execute($stmt)) {
            header('Location: index.php');
            exit();
        } else {
            // Push the database error message into the $errors array
            array_push($errors, "Error: " . mysqli_error($db));
        }

        // Close statement
        mysqli_stmt_close($stmt);
    }
} elseif(isset($_POST['cnfimBtn-update'])) {
    // Validate required fields
    if(isset($_POST['title']) && $_POST['title'] !== "") {
        $uname = $_SESSION['username'];
        $uidGet = "SELECT uid FROM users WHERE username = ?";
        $stmt = mysqli_prepare($db, $uidGet);
        mysqli_stmt_bind_param($stmt, "s", $uname);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if($result) {
            $row = mysqli_fetch_assoc($result);
            $uid = $row['uid'];

            $title = $_POST['title'];
            $selectedProjectUid = "SELECT uid FROM projects WHERE title = ?";
            $stmt = mysqli_prepare($db, $selectedProjectUid);
            mysqli_stmt_bind_param($stmt, "s", $title);
            mysqli_stmt_execute($stmt);
            $titleResult = mysqli_stmt_get_result($stmt);

            if ($titleResult) {
                if (mysqli_num_rows($titleResult) > 0) {
                    $row = mysqli_fetch_assoc($titleResult);
                    $projectOwnerUID = $row['uid'];

                    if ($uid == $projectOwnerUID) {

                        $title = $_POST['title'];
                        $start_date = $_POST['start'];
                        $end_date = $_POST['end'];
                        $phase = $_POST['phase'];
                        $description = $_POST['description'];

                        error_log(print_r($_POST, true));

                        if (!mysqli_connect_errno()) {
                            $sqlUpdate = "UPDATE projects 
                                          JOIN users ON projects.uid = users.uid 
                                          SET ";
                        
                            // Array to hold the parameters to be bound
                            $params = array();
                        
                            // Array to hold the types of parameters for binding
                            $types = '';
                        
                            if (!empty($title)) {
                                $sqlUpdate .= "title = ?, ";
                                $params[] = &$title; // Pass by reference
                                $types .= 's'; // Assuming title is a string
                            }
                            if (!empty($start_date)) {
                                $sqlUpdate .= "start_date = ?, ";
                                $params[] = &$start_date; // Pass by reference
                                $types .= 's'; // Assuming title is a string
                            }
                            if (!empty($end_date)) {
                                $sqlUpdate .= "end_date = ?, ";
                                $params[] = &$end_date; // Pass by reference
                                $types .= 's'; // Assuming title is a string
                            }
                            if (!empty($phase)) {
                                $sqlUpdate .= "phase = ?, ";
                                $params[] = &$phase; // Pass by reference
                                $types .= 's'; // Assuming phase is a string
                            }
                            if (!empty($description)) {
                                $sqlUpdate .= "description = ?, ";
                                $params[] = &$description; // Pass by reference
                                $types .= 's'; // Assuming title is a string
                            }

                        
                            // Remove the trailing comma and space from the SET clause
                            $sqlUpdate = rtrim($sqlUpdate, ', ');
                        
                            // Append the WHERE clause
                            $sqlUpdate .= " WHERE projects.uid = ? AND users.uid = ? AND projects.title = ?";
                        
                            // Add parameters for the WHERE clause
                            $params[] = &$projectOwnerUID; // Pass by reference
                            $params[] = &$uid; // Pass by reference
                            $params[] = &$title; // Pass by reference
                        
                            // Append the types for the static parameters
                            $types .= 'sss';
                        
                            // Prepare the statement
                            $stmt = mysqli_prepare($db, $sqlUpdate);
                        
                            // Bind parameters dynamically
                            array_unshift($params, $stmt, $types); // Prepend $stmt and $types to $params array
                            call_user_func_array('mysqli_stmt_bind_param', $params);
                        
                            // Execute the statement
                            mysqli_stmt_execute($stmt);                        

                                if (mysqli_stmt_affected_rows($stmt) > 0) {
                                    header('Location: index.php');
                                    exit();
                                } else {
                                    array_push($errors, 'Error updating record: ' . mysqli_error($db));
                                }

                                mysqli_stmt_close($stmt);
                        } else {
                            array_push($errors, 'Failed to connect to MySQL: ' . mysqli_connect_error());
                        }
                    } else {
                        array_push($errors, 'You do not have permission to update this project.');
                    }
                } else {
                    array_push($errors,'A project by that title does not exist in the database.');
                }
            } else {
                array_push($errors, 'Error: ' . mysqli_error($db));
            }

            mysqli_close($db);
        } else {
            array_push($errors, 'Error: ' . mysqli_error($db));
        }
    } else {
        array_push($errors, 'Title field is empty.');
    }
}