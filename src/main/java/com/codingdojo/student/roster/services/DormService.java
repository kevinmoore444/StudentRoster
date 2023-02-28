package com.codingdojo.student.roster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.student.roster.models.Dorm;
import com.codingdojo.student.roster.repositories.DormRepository;

@Service
public class DormService {

	@Autowired
	DormRepository dormRepo;
	
	//Create Dorm
	public Dorm createDorm(Dorm dorm) {
		return dormRepo.save(dorm);
	}
	
	
	//Find One Dorm
	public Dorm oneDorm(Long id) {
		Optional<Dorm> optionalDorm = dormRepo.findById(id);
		if(optionalDorm.isPresent()) {
			return optionalDorm.get();
		}
		else {
			return null;
		}
	}
	
	//All Dojos
	public List<Dorm> allDorms(){
		return dormRepo.findAll();
	}
	
	
	
}
