package com.codingdojo.student.roster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.student.roster.models.Dorm;
import com.codingdojo.student.roster.models.Student;
import com.codingdojo.student.roster.repositories.StudentRepository;

@Service
public class StudentService {

	@Autowired
	private StudentRepository studentRepo;
	
	//Create Student
	public Student createStudent(Student student) {
		return studentRepo.save(student);
		
	}
	
	//find all Students
	public List<Student> allStudents(){
		return studentRepo.findAll();
	}
	
	//find One Student
	public Student oneStudent(Long id) {
		Optional<Student> optionalStudent = studentRepo.findById(id);
		if(optionalStudent.isPresent()) {
			return optionalStudent.get();
		}
		else {
			return null;
		}
	}
	
	
	//Update Student
	public Student updateStudent(Student student, Dorm dorm) {
		student.setDorm(dorm);
		studentRepo.save(student);
		return student;
	}
	
	
	
	
	//edit
	public Student editStudetn(Student student) {
		return studentRepo.save(student);
	}
	
	//delete
	public void deleteStudent(Long id) {
		studentRepo.deleteById(id);
	}
	
	
}
