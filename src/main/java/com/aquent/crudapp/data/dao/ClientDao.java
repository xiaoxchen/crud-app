package com.aquent.crudapp.data.dao;

import com.aquent.crudapp.domain.Client;

import java.util.List;

public interface ClientDao {
    /**
     * Retrieves all of the client records.
     *
     * @return list of client records
     */
    List<Client> listClient();

    /**
     * Creates a new client record.
     *
     * @param client the values to save
     * @return the new client ID
     */
    Integer createClient(Client client);

    /**
     * Retrieves a client record by ID.
     *
     * @param id the client ID
     * @return the client record
     */
    Client readClient(Integer id);

    /**
     * Updates an existing client record.
     *
     * @param client the new values to save
     */
    void updateClient(Client client);

    /**
     * Deletes a client record by ID.
     *
     * @param id the client ID
     */
    void deleteClient(Integer id);
}
