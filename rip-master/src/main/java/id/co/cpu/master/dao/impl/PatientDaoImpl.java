package id.co.cpu.master.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import id.co.cpu.master.dao.AbstractJpaDao;
import id.co.cpu.master.dao.PatientDao;
import id.co.cpu.master.entity.Patient;

@Repository
public class PatientDaoImpl extends AbstractJpaDao<Patient> implements PatientDao {
	
	@PersistenceContext(unitName = "dbdicom")
	private EntityManager entityManager;

	public PatientDaoImpl(){
		super();
		setClazz(Patient.class);
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
	public Patient findByPatientID(String patientID){
		
		try{
			return entityManager.createQuery("select p from Patient p where p.patientID LIKE :patientID", Patient.class)
			.setParameter("patientID", patientID)			
			.getSingleResult();
		}catch(Exception e){			
			return null;		
		}
	}

}