let students = [];

function addStudent() {
    let name = document.getElementById('name').value;
    let age = document.getElementById('age').value;
    let grade = document.getElementById('grade').value;

    if (name && age && grade) {
        students.push({ name: name, age: age, grade: grade });
        document.getElementById('name').value = '';
        document.getElementById('age').value = '';
        document.getElementById('grade').value = '';
        viewStudents(); // Call viewStudents to update the table
    } else {
        alert('Please fill in all fields.');
    }
}

function viewStudents() {
    let table = `
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Grade</th>
            <th>Action</th>
        </tr>
    `; // this will be the column name of the table 

    for (let i = 0; i < students.length; i++) {
        table += `
            <tr id="row-${i}" onmouseover="changeButtonText(${i}, 'Deleting')" onmouseout="changeButtonText(${i}, 'Delete')">
                <td>${students[i].name}</td>
                <td>${students[i].age}</td>
                <td>${students[i].grade}</td>
                <td><button class="btn btn-danger" id="button-${i}" onclick="deleteStudent(${i})">Delete</button></td>
            </tr>
        `;
    }

    document.getElementById('studentTable').innerHTML = table;
}

function sortStudents() {
    students.sort(function(a, b) {
        return b.grade.localeCompare(a.grade);
    });
    viewStudents();
}

function deleteStudent(index) {
    if (confirm('Are you sure you want to delete this student?')) {
        students.splice(index, 1);
        viewStudents();
    }
}


function changeButtonText(index, text) {
    document.getElementById(`button-${index}`).innerText = text;
}
