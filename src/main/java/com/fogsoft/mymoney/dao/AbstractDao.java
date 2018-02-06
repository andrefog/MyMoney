package com.fogsoft.mymoney.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public abstract class AbstractDao<T> {
	@PersistenceContext
	protected EntityManager em;
	
	protected Class<T> entityClass;
	
	public AbstractDao(Class<T> entityClass) {
		this.entityClass = entityClass;
	}
	
	public void save(T entity) {
		em.persist(entity);
	}

	public void remove(T entity) {
		em.remove(entity);
	}

	public void update(T entity) {
		em.merge(entity);
	}
	
	public T getByKey(Object key) {
		return em.find(entityClass, key);
	}
	
	public T getByField(String field, String value) {
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<T> query = builder.createQuery(entityClass);
		Root<T> root = query.from(entityClass);

		query.where(builder.equal(root.<String>get(field), value));
		query.distinct(true);

		try {
			return em.createQuery(query).getSingleResult();
		}catch (NoResultException e) {
			return null;
		}
	}
	
	public List<T> findAll(){
		CriteriaQuery<T> query = em.getCriteriaBuilder().createQuery(entityClass);
		query.select(query.from(entityClass));
		return em.createQuery(query).getResultList();
	}
	
	public List<T> findRange(int[] range){
		CriteriaQuery<T> queryFrom = em.getCriteriaBuilder().createQuery(entityClass);
		queryFrom.select(queryFrom.from(entityClass));
		
		TypedQuery<T> query = em.createQuery(queryFrom);
		query.setMaxResults(range[1] - range[0]);
		query.setFirstResult(range[0]);
		
		return query.getResultList();
	}
	
	public int count() {
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<Long> query = builder.createQuery(Long.class);
		Root<T> root = query.from(entityClass);
		query.select(builder.count(root));
		
		Long count = em.createQuery(query).getSingleResult();
		return count.intValue();
	}
}
