let students = [];

// from here i will add the number of student i want to add...
function startProgram() {
    let numStudents = parseInt(prompt("How many students do you want to add?"));

    if (isNaN(numStudents) || numStudents <= 0) {
        document.getElementById('output').innerHTML = "Please enter a valid number of students.";
        return;
    }
    // taking the input from the user 
    for (let i = 0; i < numStudents; i++) {
        let name = prompt(`Enter the name of student:`);
        let age = prompt(`Enter the age of student :`);
        let grade = prompt(`Enter the grade of student:`);

        if (name && age && grade) {
            students.push({ name: name, age: age, grade: grade }); // push will insert the element at the end of an array 
        } else {
            document.getElementById('output').innerHTML += `Please fill in all fields for student.\n`;
        }
    }
    // in the above section we can use the splice() as well but we have to provide the index of the student when we use the splice() function.
    // push will be the first choice because it will add the student at the end of an array.

    document.getElementById('output').innerHTML += 'Students added successfully!\n';
    mainMenu();
}

// this function is used to view the student present in the table 
function viewStudents() {
    if (students.length === 0) {
        document.getElementById('output').innerHTML = "No students to display.\n";
        return;
    }

    let studentList = "Students:\n";
    students.forEach((student, index) => {
        studentList += `${index + 1}. Name: ${student.name}, Age: ${student.age}, Grade: ${student.grade}\n`;
    }); //${} is used to insert the value of the thing with in string.
    document.getElementById('output').innerHTML = studentList;
}

// from here we can sort the student on the basis of the grades(A,B,C,D)
function sortStudents() {
    students.sort((a, b) => b.grade.localeCompare(a.grade)); // localecompare() compares strings based on their alphabetical order.
    document.getElementById('output').innerHTML = "Students sorted by grade in descending order.\n";
}

// if the user wants to delete the student.
function deleteStudent() {
    let index = parseInt(prompt("Enter the student number to delete:"));

    if (index > 0 && index <= students.length) {
        students.splice(index - 1, 1);
        document.getElementById('output').innerHTML = 'Student deleted successfully!\n';
    } else {
        document.getElementById('output').innerHTML = 'Invalid student number.\n';
    }
}

// main menu.
function mainMenu() {
    let choice = prompt("Choose an action:\n1. View Students\n2. Sort Students\n3. Delete Student\n4. Exit");

    switch (choice) {
        case '1':
            viewStudents();
            break;
        case '2':
            sortStudents();
            break;
        case '3':
            deleteStudent();
            break;
        case '4':
            document.getElementById('output').innerHTML += 'Exiting the Student Management System.\n';
            break;
        default:
            document.getElementById('output').innerHTML += 'Invalid choice. Please try again.\n';
            mainMenu(); // I have used the mainmenu function again so that if the user enter any invalid number it will go to menu again.
            break;
    }
}

// Mouseover and mouseout event listener functionality 
function addHoverEffect(buttonId) {
    const button = document.getElementById(buttonId);

    // Mouseover event
    button.addEventListener('mouseover', function () {
        button.style.backgroundColor = '#feb47b'; // Change to lighter shade on hover
        button.innerHTML = '!!!!!!!!!!!!!';
    });

    // Mouseout event function..... 
    button.addEventListener('mouseout', function () {
        button.style.backgroundColor = '#ff6f61'; // change to original color on mouseout
        button.innerHTML = 'Start Program'; 
    });
}

// Call this function once the DOM is loaded
document.addEventListener('DOMContentLoaded', function () {
    addHoverEffect('startButton'); // Apply hover effect to the Start button
});
