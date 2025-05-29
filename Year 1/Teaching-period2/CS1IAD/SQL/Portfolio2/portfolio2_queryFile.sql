/*
    myPhpAdmin Queries for portfolio 2 database
*/

/*
    Following select/update statement
    Will complete R5 requirement 5 from CS1IAD-Portfolio2.xoop on BlackBoard as of 04/03/2024
*/

select * from skill_list where skill_list.emp_full_name is not null and ((skill_id = 'DB_SQL' and skill_level = 'senior') or (skill_id = 'HTML_WebDev' and skill_level = 'senior'));

update pool_members
join skill_list on skill_list.emp_full_name = pool_members.full_name
set pool_members.current_project = 'HTML website linked with '
where skill_list.emp_full_name is not null and ((skill_list.skill_id = 'DB_SQL' and skill_list.skill_level = 'senior') or (skill_list.skill_id = 'HTML_WebDev' and skill_list.skill_level = 'senior'));

/*
    DEMONSTRATING THE STRENGTHS OF MY PORTFOLIO'S DATABASE
*/

/* Basic ones */

-- selecting pool_members in a specific building that are unassigned to a project

select * from pool_members where build_id = 1 and current_project = 'employee unassigned';

-- selecting projects that do not have employee(s) assigned (can be changed so that it shows projects based on any phase)

select * from projects where current_phase = 'employee unassigned';

-- selecting skill_list entry's that are for projects

select * from skill_list where project_title is not null;

/* Not so basic ones */

-- selecting skill_list entry's that are related to projects that have pool_members assigned to them

select * from skill_list
join projects on skill_list.project_title = projects.title
join pool_members on projects.title = pool_members.current_project;

-- the below select will take all projects columns and then to the right add clients contact_first_name and contact_last_name columns as well as a 3rd added column which is based on the preferred contact of the client associated

SELECT projects.*, clients.contact_first_name, clients.contact_last_name,
CASE
when clients.preferred_contact = 'email' then clients.email
when clients.preferred_contact = 'post' then concat(clients.address_line1, clients.address_line2, clients.address_postcode, clients.address_postcode, clients.address_country)
end as contact_info
from projects
inner join clients on projects.org_name = clients.org_name;

-- select all projects and associated pool_members

SELECT projects.title, pool_members.first_name, pool_members.last_name, pool_members.email, pool_members.phone
FROM projects 
inner JOIN pool_members ON projects.title = pool_members.current_project;

-- checks skill_list for project entry's and checks if those entry's have employee(s) assigned then deleting them if they do

delete from skill_list
join pool_members
where skill_list.project_title is not null && (skill_list.project_title = pool_members.current_project)

-- updating projects current_phase where employee(s) have been assigned

update projects
join pool_members
set projects.current_phase = 'design'
where projects.title = pool_members.current_project