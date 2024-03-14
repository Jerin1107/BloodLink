# Blood Link: Blood Bank Management System

## Application URL
[http://bbms.pythonanywhere.com/](http://bbms.pythonanywhere.com/)

## Project Summary
The Blood Link project is a web-based blood bank management system designed to facilitate blood donation and distribution. Users can register as donors or recipients, search for blood availability, schedule appointments, and manage inventory. The system aims to streamline the blood donation process and ensure efficient management of blood banks.

## Project Objectives
- Design and develop a user-friendly web application for blood donation and distribution.
- Ensure the safety and confidentiality of donor and recipient information.
- Manage blood inventory, appointments, and provide statistical dashboards.
- Provide accurate information on blood availability to users.

## Project Usefulness
- Centralized solution for blood donation and distribution.
- Convenience for donors and recipients in scheduling appointments and searching for blood.
- Efficient inventory management for blood bank administration.

## Technical Description
### Data
- Utilizes the "Blood Bank Directory - India" Kaggle dataset.
- Normalized and separated data into user, donor, recipient, and blood bank tables.

### MVC Architecture
- **Model:** Backend data logic stored in MySQL database.
- **View:** Frontend created using HTML, CSS, and Bootstrap.
- **Controller:** Flask manages data display and interaction.

### Deployment Platform
- Deployed on PythonAnywhere by Anaconda for easy web hosting and scaling.

### Tools
- Frontend: HTML, CSS, JavaScript, Bootstrap
- Backend: Python, Flask
- Database: MySQL

## User Functionalities
- User registration based on user type (donor/recipient).
- Profile management: users can update their details and view appointment history.
- Booking appointments at blood banks.
- Admin functionalities: view user details, accept/reject appointments, edit user details, and delete users.

