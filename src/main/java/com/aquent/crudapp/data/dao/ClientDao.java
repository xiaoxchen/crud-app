package com.aquent.crudapp.data.dao;

import com.aquent.crudapp.domain.Client;

import java.util.List;

public interface ClientDao {
    // TODO change java doc
    /**
     * Retrieves all of the person records.
     *
     * @return list of person records
     */
    List<Client> listClient();

    /**
     * Creates a new person record.
     *
     * @param person the values to save
     * @return the new person ID
     */
    Integer createClient(Client client);

    /**
     * Retrieves a person record by ID.
     *
     * @param id the person ID
     * @return the person record
     */
    Client readClient(Integer id);

    /**
     * Updates an existing person record.
     *
     * @param person the new values to save
     */
    void updateClient(Client client);

    /**
     * Deletes a person record by ID.
     *
     * @param id the person ID
     */
    void deleteClient(Integer id);
}
