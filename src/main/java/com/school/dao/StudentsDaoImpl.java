package com.school.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.school.dto.AdmissionDto;
import com.school.dto.FeesAmountDto;
import com.school.dto.StudentsDTO;
import com.school.mapper.RemFeesMapper;
import com.school.mapper.StudentsMapper;

@Repository
public class StudentsDaoImpl implements StudentsDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int getPK() {
		String sql = "select max(id) from students";
		return jdbcTemplate.queryForObject(sql,Integer.class)  ;
	}
	
	public void saveStudents(AdmissionDto dto) {
	System.out.println("inside DB method");
		String sql = "insert into students values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";

		Object[] args = { getPK(), dto.getfName(), dto.getfName(), dto.getfOccupation(), dto.getmName(), dto.getmOccupation(), dto.getCategory(), 
						  dto.getAltContact(), dto.getDob(), dto.getSamagraId(), dto.getAadhar(), dto.getBankName(), dto.getAccNo(), 
						  dto.getIfsc(), dto.getAddress(), dto.getLastClassAttended(), dto.getCity(), dto.getState(), dto.getZip(), 
						  dto.getBranch(), dto.getStuClass(), dto.getFees(), dto.getGender(), dto.getCategory(), dto.getAdmissionDate(),
						  dto.getScholarNumber(), dto.getLastSchoolStudied(), dto.getBirthPlace(), dto.getReligion(), dto.getSamagraId()};
				;
		jdbcTemplate.update(sql, args);
		System.out.println("inserted");
	}

	@Override
	public StudentsDTO getStudent(int id) {
		String sql = "select * from students where id=?";
		StudentsDTO student = jdbcTemplate.queryForObject(sql,new StudentsMapper(),id);
		return student;
	}
	
	public StudentsDTO getStudentbyRollNo(String rollNo) {
		String sql = "select * from students where roll_no=?";
		StudentsDTO student = jdbcTemplate.queryForObject(sql,new StudentsMapper(),rollNo);
		return student;
	}

	public List<StudentsDTO> searchStudentbyRollNo(String rollNo) {
		String sql = "select * from students where roll_no Like ?";
		List<StudentsDTO> studentList = jdbcTemplate.query(sql,new StudentsMapper(),new String[] { "%" + rollNo + "%" });
		return studentList;
	}
	
	public List<StudentsDTO> searchStudentbyName(String name) {
		String sql = "select * from students where name Like ?";
		List<StudentsDTO> studentList = jdbcTemplate.query(sql,new StudentsMapper(),new String[] { "%" + name + "%" });
		return studentList;
	}
	
	public List<StudentsDTO> searchStudentbyClass(String classes) {
		String sql = "select * from students where classes=?";
		List<StudentsDTO> studentList = jdbcTemplate.query(sql,new StudentsMapper(),classes);
		return studentList;
	}
	
	public List<String> listOfclasses() {
		String sql = "select distinct classes from students";
		List<String> classes = jdbcTemplate.query(sql,new RowMapper<String>() {
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString(1);
            }
        });
		return classes; 
	} 

	@Override
	public List<StudentsDTO> listStudents() {
		String sql = "select * from students";
		List<StudentsDTO> studentList = jdbcTemplate.query(sql, new StudentsMapper());
//		displayStudent(studentList);
		return studentList;
	}

	public List<FeesAmountDto> remainingFees() {
		String sql ="SELECT roll_no,SUM(amount) FROM fees GROUP BY roll_no";
	List<FeesAmountDto> feesDto = 	jdbcTemplate.query(sql, new RemFeesMapper());
	return feesDto;
	}
	
	public int totalRemainingFees() {
		String sql ="SELECT SUM(amount) FROM fees";
	return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	
	
	public int totalFees() {
		String sql  = "SELECT SUM(fees) FROM students";
		return  jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public void displayStudent(List<StudentsDTO> student) {
		for (StudentsDTO stu : student) {
			System.out.println(stu);
		}
	}

	
	@Override
	public void deleteStudent(String rollNo) {
		String sql = "delete  from students where roll_no=?";
		jdbcTemplate.update(sql,rollNo);
		System.out.println("Student deleted");
	}

	
	@Override
	public void updateStudent(StudentsDTO dto) {
		String sql = "update students set name=?, father_name=?,mother_name=?,classes=?,fees=?,session=?,address=?,mobile=? where roll_no=?";
		Object[] args = {dto.getName(), dto.getFather_name(), dto.getMother_name(),dto.getClasses(),dto.getFather_name(), dto.getSession(), dto.getAddress(),dto.getMobile(), dto.getRoll_no()};
		int result= jdbcTemplate.update(sql, args);
		System.out.println("Record updated");
	}

	@Override
	public void addStudents(StudentsDTO dto) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
