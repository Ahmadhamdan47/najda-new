const mysql = require('mysql');
const xlsx = require('xlsx');

// Load the Excel file
const workbook = xlsx.readFile('najdata.xlsx');

// Connect to MySQL
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'najda_new'
});

connection.connect(err => {
  if (err) throw err;
  console.log('Connected to MySQL');
});

// Get data from each sheet
const familiesSheet = xlsx.utils.sheet_to_json(workbook.Sheets['Sheet2']);


// Insert data into Families table
familiesSheet.forEach(row => {
  const sql = `INSERT INTO families (family_head, total_members, under_two_years, under_thirteen_years, over_thirteen_years, marital_status, health_conditions, notes, phone_number, house_id, furniture_needed, clothes_needed, household_tools_needed)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
  const values = [
    row['رب العائلة'],  // Adjust column names as needed
    row['عدد الافراد'],
    row['الفئة العمرية (تحت السنتين)'],
    row['تحت ال13 سنة'],
    row['فوق ال13'],
    row['الحالة الاجتماعية'],
    row['الحالات المرضية'],
    row['ملاحظات'],
    row['رقم الهاتف'],
    row['رقم البيت'],  // Assuming this is the house ID
    row['فرش'] === 'نعم',  // Convert to boolean
    row['ملابس'] === 'نعم',  // Convert to boolean
    row['ادوات منزلية'] === 'نعم'  // Convert to boolean
  ];

  connection.query(sql, values, (err, result) => {
    if (err) throw err;
    console.log('Family data inserted');
  });
});





// Close the MySQL connection
connection.end(err => {
  if (err) throw err;
  console.log('Connection to MySQL closed');
});
