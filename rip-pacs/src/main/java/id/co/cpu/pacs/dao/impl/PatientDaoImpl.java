package id.co.cpu.pacs.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.pacs.dao.AbstractJpaDao;
import id.co.cpu.pacs.dao.PatientDao;
import id.co.cpu.pacs.entity.PatientDicomEntity;

@Repository
public class PatientDaoImpl extends AbstractJpaDao<PatientDicomEntity> implements PatientDao {
	
	@PersistenceContext(unitName = "rip")
	private EntityManager entityManager;

	public PatientDaoImpl(){
		super();
		setClazz(PatientDicomEntity.class);
	}
	
	/*@Transactional
	@Override
	public void save(Patient patient) {
		entityManager.persist(patient);		
		entityManager.flush();
	}

	@Override
	public List<Patient> findAll() {
		
		try{			
			TypedQuery<Patient> query = entityManager.createQuery("select p FROM Patient p", Patient.class);			 
			return query.getResultList();
			
		}catch(Exception e){
			return null;		
		}
	}

	@Override
	public Patient findByID(long pkTBLPatientID) {
		try{			
			return entityManager.find(Patient.class, pkTBLPatientID);
			
		}catch(Exception e){
			return null;
		}
	}*/
	
	@Override 
	public PatientDicomEntity findByPatientId(String patientId){
		
		try{
			return entityManager.createQuery("select p from PatientDicomEntity p where p.patientId LIKE :patientId", PatientDicomEntity.class)
			.setParameter("patientId", patientId)			
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}

}
