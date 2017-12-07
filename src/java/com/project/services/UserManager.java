/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.services;

import com.project.entity.UserModel;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Diknas 113
 */
@Service
public class UserManager {
    @PersistenceContext
    private EntityManager userManager;

    public UserManager()
    {
      userManager = Persistence.createEntityManagerFactory("JPALibraryPU").createEntityManager();
    }

    @Transactional
    public UserModel getUser(String user_id)
    {
        UserModel result = userManager.find(UserModel.class, user_id);
        return result;
    }
}
