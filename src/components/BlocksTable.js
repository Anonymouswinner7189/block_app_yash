import React from "react";
import "./TableStyles.css";

const BlocksTable = ({ blocks }) => {
  const filteredBlocks = blocks.filter((block) => block.index > 0);

  if (filteredBlocks.length === 0) {
    return <p>No blocks to display.</p>;
  }

  return (
    <div className="table-container">
      {/* Center the table */}
      <table className="blocks-table">
        {/* Apply table styles */}
        <thead>
          <tr>
            <th>Index</th>
            <th>Student Name</th>
            <th>USN</th>
            <th>Date of Birth</th>
            <th>Semester</th>
            <th>CGPA</th>
            <th>Address</th>
            {/* <th>Hash</th> */}
          </tr>
        </thead>
        <tbody>
          {filteredBlocks.map((block, index) => (
            <tr key={index}>
              <td>{index + 1}</td>
              <td>{block.studentName}</td>
              <td>{block.usn}</td>
              <td>{block.dob}</td>
              <td>{block.semester}</td>
              <td>{block.cgpa}</td>
              <td>{block.studentAddress}</td>
              {/* <td>{block.hash}</td> */}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default BlocksTable;
