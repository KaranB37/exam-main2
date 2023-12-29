import React from "react";
import axios from "axios";
import { useState, useEffect } from "react";
import jsPDF from "jspdf";

const Seat_allotment = () => {
  const [branch_data, setBranchdata] = useState([]);
  const [subjectOptions, setSubjectOptions] = useState([]);
  const [semesterOptions, setSemesterOptions] = useState([]);
  const [classroomData, setClassroomData] = useState([]);
  const [examIdData, selectedExamId] = useState([]);
  const [selectedDate, setSelectedDate] = useState(new Date());
  const [selectedSemester, setSelectedSemester] = useState("");
  const [selectedBranchId, setSelectedBranchId] = useState("");
  const [selectedDivision, setSelectedDivision] = useState("");
  const [totalStudents, setTotalStudents] = useState(0);
  const [selectedCapacity, setSelectedCapacity] = useState(0);
  const [studentsData, setStudentsData] = useState([]);
  const [assignedSeats, setAssignedSeats] = useState({});
  const [studentCounter, setStudentCounter] = useState(0);
  const [selectedClassroomId, setSelectedClassroomId] = useState("");

  const handleSeatClick = (roomNumber, benchNumber) => {
    const clickedBox = `roomno:${roomNumber}`;

    if (studentsData.length > 0 && studentCounter > 0) {
      const updatedAssignedSeats = { ...assignedSeats };

      if (!updatedAssignedSeats[clickedBox]) {
        updatedAssignedSeats[clickedBox] = [];
      }

      const availableStudents = studentsData.filter(
        (student) =>
          !Object.values(updatedAssignedSeats)
            .flat()
            .some((seat) => seat.studentId === student.student_id)
      );

      if (availableStudents.length > 0) {
        updatedAssignedSeats[clickedBox] = [
          ...updatedAssignedSeats[clickedBox],
          {
            studentId: availableStudents[0].student_id,
            boxIndex: benchNumber,
          },
        ];

        setAssignedSeats(updatedAssignedSeats);
        setStudentCounter(studentCounter - 1);
        console.log("assigned seats", updatedAssignedSeats);
      } else {
        console.log("No more students to assign to this box");
      }
    } else {
      console.log("No more students to assign or no students data available");
    }
  };

  const generatePDF = () => {
    const doc = new jsPDF();

    const selectedClassroom = classroomData.find(
      (classroom) => classroom.room_number === selectedClassroomId
    );

    if (selectedClassroom) {
      const { room_number } = selectedClassroom;

      let y = 10;
      doc.text(10, y, `Room Number: ${room_number}`);
      y += 10;

      Object.entries(assignedSeats).forEach(([key, value]) => {
        if (key !== `roomno:${room_number}`) {
          doc.text(10, y, `Room Number: ${key}`);
          y += 10;

          value.forEach((seat) => {
            doc.text(
              20,
              y,
              `Student ID: ${seat.studentId}, Bench no: ${seat.boxIndex}`
            );
            y += 10;
          });
          y += 10; // Add some space between each room's data
        }
      });
    }

    doc.save("assigned_seats.pdf");
  };

  const [seatAssignments, setSeatAssignments] = useState(
    Array(parseInt(selectedCapacity)).fill(null)
  );

  useEffect(() => {
    if (Number.isInteger(selectedCapacity) && selectedCapacity > 0) {
      setSeatAssignments(Array(selectedCapacity).fill(null));
    } else {
      setSeatAssignments([]); // Reset seat assignments if selectedCapacity is invalid
      console.error("Invalid selected capacity:", selectedCapacity);
    }
  }, [selectedCapacity]);

  const handleDateChange = (e) => {
    setSelectedDate(new Date(e.target.value));
  };

  const handleClassroomChange = (e) => {
    const selectedClassroomId = e.target.value;
    setSelectedClassroomId(selectedClassroomId);
    const selectedClassroom = classroomData.find(
      (classroom) => classroom.room_number === selectedClassroomId
    );

    if (selectedClassroom) {
      console.log("Selected Classroom ID: ", selectedClassroom.room_number);
      console.log("Selected Classroom Capacity: ", selectedClassroom.capacity);
      setSelectedCapacity(selectedClassroom.capacity); // Set the selected capacity in state
    } else {
      console.log("Classroom not found");
      setSelectedCapacity(0); // Clear the selected capacity in state if not found
    }
  };

  const handleExamChange = (e) => {
    const selectedExamId = e.target.value;
    console.log("Selected Exam ID: ", selectedExamId);
  };

  const handleDivsionChange = (e) => {
    const selectedDivisionId = e.target.value;
    setSelectedDivision(e.target.value);
    console.log("Selected Division ID: ", selectedDivisionId);
  };

  const handleSubjectChange = (e) => {
    const selectedSubjectId = e.target.value;
    console.log("Selected Subject ID: ", selectedSubjectId);
  };

  const handleSemester = (e) => {
    const setSemesterOptions = e.target.value;
    setSelectedSemester(e.target.value);
    console.log("Selected Semester ID: ", setSemesterOptions);
  };

  const branchChange = (e) => {
    const setBranchdata = e.target.value;
    setSelectedBranchId(e.target.value);
    console.log("Selected Branch ID: ", setBranchdata);
  };

  const handleBoxClick = (boxIndex) => {
    console.log(`Clicked box ${boxIndex}`);
  };

  useEffect(() => {
    const getClassroomData = async () => {
      try {
        const res = await axios.get(
          `${process.env.REACT_APP_BASE_URL}/getClassroomData`
        );
        setClassroomData(res.data);
        console.log("Classroom Data:", res.data);
      } catch (error) {
        console.error("Error fetching classroom data:", error.message);
      }
    };
    getClassroomData();

    const getSemesterData = async () => {
      try {
        const res = await axios.get(
          `${process.env.REACT_APP_BASE_URL}/getSemesterData`
        );
        setSemesterOptions(res.data);
        console.log("Semester Data : ", res.data);
      } catch (error) {
        console.error("Error fetching semester data:", error.message);
      }
    };
    getSemesterData();

    const getBranchData = async () => {
      try {
        const res = await axios.get(
          `${process.env.REACT_APP_BASE_URL}/getbranchdata`
        );
        setBranchdata(res.data);
        console.log("Branch Data: ", branch_data);
      } catch (error) {
        console.error("Error fetching branch data:", error.message);
      }
    };

    getBranchData();

    const getSubjectsData = async () => {
      try {
        const res = await axios.get(
          `${process.env.REACT_APP_BASE_URL}/getSubjectsData`,
          {
            params: {
              branch_id: selectedBranchId,
              semester: selectedSemester,
            },
          }
        );
        setSubjectOptions(res.data);
        console.log("Subject Data: ", res.data);
      } catch (error) {
        console.error("Error fetching subject data:", error.message);
      }
    };
    getSubjectsData();

    const getTotalStudents = async () => {
      try {
        const res = await axios.get(
          `${process.env.REACT_APP_BASE_URL}/getTotalStudents`,
          {
            params: {
              branch_id: selectedBranchId,
              semester: selectedSemester,
              division: selectedDivision,
            },
          }
        );
        const fetchedStudents = res.data;
        setTotalStudents(fetchedStudents.length);
        setStudentCounter(fetchedStudents.length);
        setStudentsData(fetchedStudents); // Save fetched student data
        console.log("Total students count:", fetchedStudents.length);
        console.log("Total students", fetchedStudents);
      } catch (error) {
        console.error("Error fetching total students:", error.message);
      }
    };
    getTotalStudents();
  }, [selectedBranchId, selectedSemester, selectedDivision, totalStudents]);

  const handleSubmitData = async (event) => {
    event.preventDefault();
    generatePDF();
    console.log("Ok Babu");
  };

  return (
    <form className="mainContent" onSubmit={handleSubmitData}>
      <div className="mapping">
        <p className="font-weight-800">Student-Seat Mapping</p>
        <div className="col-div">
          <div className="s1">
            <span className="fontSizeSmall">Select Date</span>
            <input
              type="date"
              className="select"
              style={{ padding: "18px" }}
              value={selectedDate.toISOString().split("T")[0]} // Set initial value to today's date
              onChange={handleDateChange}
            />
          </div>

          <div className="s1">
            <span className="fontSizeSmall">Select Classroom</span>
            <select
              className="select"
              name="form-control"
              id="branch"
              onChange={handleClassroomChange}
            >
              <option value="">Select Classroom</option>
              {classroomData.map((classroom, i) => (
                <option key={i} value={classroom.room_number}>
                  {classroom.room_number} (Capacity: {classroom.capacity})
                </option>
              ))}
            </select>
          </div>

          <div className="s1">
            <span className="fontSizeSmall">Select Semester</span>
            <select
              name="semester"
              className="form-control"
              onChange={handleSemester}
            >
              <option value="">--Select Semester--</option>
              {semesterOptions.map((semester) => (
                <option key={semester.ID} value={semester.semester}>
                  {semester.semester}
                </option>
              ))}
            </select>
          </div>

          <div className="s1">
            <span className="fontSizeSmall">Select Branch</span>
            <select
              className="select"
              name="form-control"
              id="branch"
              onChange={branchChange}
            >
              <option value="">Select Branch</option>
              {branch_data.map((branch) => (
                <option key={branch.branch_id} value={branch.branch_id}>
                  {branch.branch_name}
                </option>
              ))}
            </select>
          </div>
          <div className="s1">
            <span className="fontSizeSmall">Select Exam</span>
            <select
              className="select"
              name="ac-yr"
              id="ac-yr"
              onChange={handleExamChange}
            >
              <option value={""}>Select Exam</option>
              <option value={"PT1"}>PT1</option>
              <option value={"PT2"}>PT2</option>
              <option value={"Final"}>Final</option>
              {/* Add more options as needed */}
            </select>
          </div>

          <div className="s1">
            <span className="fontSizeSmall">Select Subject</span>
            <select
              name="subjects"
              className="form-control"
              onChange={handleSubjectChange}
            >
              <option value="">--Select Subject--</option>
              {subjectOptions.map((getsubject, index) => (
                <option value={getsubject.subject_code} key={index}>
                  {getsubject.subject_name}
                </option>
              ))}
            </select>
          </div>

          <div className="s1">
            <span className="fontSizeSmall">Division</span>
            <select
              name="subjects"
              className="form-control"
              onChange={handleDivsionChange}
            >
              <option value="">--Select Div--</option>
              <option value={1}>A</option>
              <option value={2}>B</option>
            </select>
          </div>
          <div className="s1">
            <span className="fontSizeSmall">Total Students</span>
            <input
              className="select"
              type="text"
              value={totalStudents} // Display totalStudents value
              readOnly
            />
          </div>

          <div className="s1">
            <button type="submit" className="btn">
              Generate
            </button>
          </div>
        </div>
      </div>

      {/* Display seats */}

      <div className="classroom">
        {[...Array(parseInt(selectedCapacity))].map((_, index) => (
          <div
            key={index}
            className={`box ${
              assignedSeats[`roomno:${index}`]?.some(
                (seat) => seat.boxIndex === index
              )
                ? "green-box"
                : ""
            }`}
            onClick={() => handleSeatClick(index, index)}
          >
            {assignedSeats[`roomno:${index}`]?.find(
              (seat) => seat.boxIndex === index
            ) && (
              <p>
                Student ID:{" "}
                {
                  assignedSeats[`roomno:${index}`]?.find(
                    (seat) => seat.boxIndex === index
                  ).studentId
                }
              </p>
            )}
          </div>
        ))}
      </div>
    </form>
  );
};

export default Seat_allotment;
