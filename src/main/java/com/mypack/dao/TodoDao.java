package com.mypack.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mypack.entity.Todo;
@Component
public class TodoDao {

	@Autowired
	HibernateTemplate hibernateTamplate;

	@Transactional
	public int save(Todo t) {
		Integer i = (Integer) this.hibernateTamplate.save(t);
		return i;
	}

	public List<Todo> getAll() {

		List<Todo> todos = this.hibernateTamplate.loadAll(Todo.class);
		return todos;
	}
}
