// testing to see if js works

// const test = document.getElementById("test");
//         test.addEventListener("click", function(e){
//                 document.getElementById("errorEmails").style.display = "none";
//         });
//         const test2 = document.getElementById("test2");
//         test2.addEventListener("click", function(e){
//             if (document.getElementById("errorEmails").style.display == "none") {
//                 document.getElementById("errorEmails").style.display = "";
//             }
//         });

// Submit Button functionality  - Form Validation

const form = document.getElementById("form");
const dateInput = document.getElementById("app-date");
const email = document.getElementById("email");
const ConEmail = document.getElementById("c-email");
const errorElement = document.getElementById("error");
const PrefContact = document.getElementById("contChoice");

// Val Form
form.addEventListener("submit", validateForm);

function validateForm(e) {
    e.preventDefault();

    // Retrieve form field values
    const firstName = document.getElementById("fname").value;
    const lastName = document.getElementById("lname").value;
    const appDate = document.getElementById("app-date").value;
    const appLength = document.getElementById("app-dur").value;
    const desc = document.getElementById("desc").value;
    const contChoice = document.getElementById("contChoice").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;
    const conEmail = document.getElementById("c-email").value;
    
    // Validate form fields
    const isContactMethodSelected = contChoice !== '';
    const areEmailsMatching = email === conEmail;
    const isDateValid = checkDate(appDate);

    // Show error messages if validation fails
    const errorElement = document.getElementById("error");
    errorElement.innerText = '';

    if (!isContactMethodSelected) {
        errorElement.innerText = 'Please choose a contact method';
    }
    if (!areEmailsMatching) {
        errorElement.innerText += ' Emails must match';
    }
    if (!isDateValid) {
        errorElement.innerText += ' Date must be at least 1 day after today';
    }

    // If all validations pass, show the modal
    if (isContactMethodSelected && areEmailsMatching && isDateValid) {
        displayModal(firstName, lastName, appDate, appLength, desc, contChoice, email, phone);
    }
}

function displayModal(firstName, lastName, appDate, appLength, desc, contChoice, email, phone) {
    console.log("Displaying modal...")

    const modal = document.getElementById("modal");
    const span = document.getElementsByClassName("close")[0];
    const Name = document.getElementById("Name");
    const appBooking = document.getElementById("appBooking");
    const appDesc = document.getElementById("appDesc");
    const contact = document.getElementById("conMethod");

    Name.innerText = "Name: " + firstName + " " + lastName;
    appBooking.innerText = "Appointment Booking: Your appointment will be on "+ appDate + " and will be " + appLength + " hours long";
    appDesc.innerText = desc;
    
    let contactType;
    if (contChoice == 'Email') {
        contactType = email;
    }
    else if (contChoice == 'Phone') {
        contactType = phone;
    }
    else if (contChoice == 'Both') {
        contactType = email + " and " + phone;
        contChoice = 'email and phone';
    }
    contact.innerText = "We will contact you via " + contChoice + " using " + contactType;

    modal.style.display = "block";

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(e) {
        if (e.target == modal) {
            modal.style.display = "none";
        }
    }
}

// CHECK EMAILS

function checkEmails() {
    return email.value === ConEmail.value;
}

// CHECK DATE

function checkDate() {
    let now  = new Date();
    let chosen = new Date(dateInput.value);

    // now.setDate(now.getDate() + 1);

    return chosen > now;
}

// MailTo

const confirm = document.getElementById("confirmBttn");
confirm.addEventListener('click', e => {
    const firstName = document.getElementById("fname").value;
    const lastName = document.getElementById("lname").value;
    const appDate = document.getElementById("app-date").value;
    const appLength = document.getElementById("app-dur").value;
    const desc = document.getElementById("desc").value;
    const contChoice = document.getElementById("contChoice").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;
    sendEmail(firstName, lastName, appDate, appLength, desc, contChoice, email, phone)
})

function sendEmail(firstName, lastName, appDate, appLength, desc, contChoice, email, phone) {
    let body;
    body = 'Name: ' + firstName + " " + lastName;
    body += '\nAppointment Booking: Your appointment will be on ' + appDate + ' and will be ' + appLength + ' hours long' ;
    body += '\nAppointment Description:\n' + desc;
    let contactType;
    if (contChoice == 'Email') {
        contactType = email;
    }
    else if (contChoice == 'Phone') {
        contactType = phone;
    }
    else if (contChoice == 'Both') {
        contactType = email + " and " + phone;
        contChoice = 'email and phone';
    }
    body += '\nWe will via ' + contChoice + ' using ' + contactType;   

    window.location = 'mailto:210163492@aston.ac.uk?body='+ encodeURIComponent(body) +'&subject=Appointment Booking:';
}