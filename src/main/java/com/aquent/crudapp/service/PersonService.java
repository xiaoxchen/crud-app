package com.aquent.crudapp.service;

import java.util.List;

import com.aquent.crudapp.domain.Person;

/**
 * Person operations.
 */
public interface PersonService {

    /**
     * Retrieves all of the person records.
     *
     * @return list of person records
     */
    List<Person> listPeople();

    /**
     * Creates a new person record.
     *
     * @param person the values to save
     * @return the new person ID
     */
    Integer createPerson(Person person);

    /**
     * Retrieves a person record by ID.
     *
     * @param id the person ID
     * @return the person record
     */
    Person readPerson(Integer id);

    /**
     * Updates an existing person record.
     *
     * @param person the new values to save
     */
    void updatePerson(Person person);

    /**
     * Deletes a person record by ID.
     *
     * @param id the person ID
     */
    void deletePerson(Integer id);

    /**
     * Validates populated person data.
     *
     * @param person the values to validate
     * @return list of error messages
     */
    List<String> validatePerson(Person person);

    /**
     * Update client and contact relationship
     *
     * @param clientId
     * @param personId
     */
    void updateClient(Integer clientId, Integer personId);

    /**
     * Count how many contacts of one client
     *
     * @param clientId
     * @return number of contacts
     */
    Integer countByClientId(Integer clientId);

    /**
     * Get all contacts ids of one client
     *
     * @param clientId
     * @return list of contact ids
     */
    List<Integer> getPersonIdByClientId(Integer clientId);

    /**
     * Get all contacts object of one client
     *
     * @param clientId
     * @return list of Person object
     */
    List<Person> getPersonByClientId(Integer clientId);
}
