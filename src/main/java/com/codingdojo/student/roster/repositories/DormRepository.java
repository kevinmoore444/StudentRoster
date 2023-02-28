package com.codingdojo.student.roster.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.student.roster.models.Dorm;

public interface DormRepository extends CrudRepository<Dorm, Long>{
	List<Dorm> findAll();
}
