package com.codingdojo.student.roster.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.student.roster.models.Student;

public interface StudentRepository extends CrudRepository<Student, Long>{
	List<Student> findAll();
}