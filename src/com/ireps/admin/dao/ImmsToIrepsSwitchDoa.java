package com.ireps.admin.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ireps.admin.entity.ImmsToIrepsSwitchForm;

@Repository
public interface ImmsToIrepsSwitchDoa extends JpaRepository<ImmsToIrepsSwitchForm, String>{

	
}
