package com.aquent.crudapp.data.dao.jdbc;

import com.aquent.crudapp.data.dao.ClientDao;
import com.aquent.crudapp.domain.Client;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class ClientJdbcDao implements ClientDao{

    private static final String SQL_LIST_CLIENTS = "SELECT * FROM client ORDER BY id, client_name";
    private static final String SQL_READ_CLIENT = "SELECT * FROM client WHERE id = :client_id";
    private static final String SQL_DELETE_CLIENT = "DELETE FROM client WHERE id = :client_id";
    private static final String SQL_UPDATE_CLIENT = "UPDATE client SET (client_name, website_url, phone_number, line_1, " +
            "line_2, line_3, city, state, zipcode)"
            + " = (:client_name, :website_url, :phone_number, :line_1, :line_2, :line_3, :city, :state, :zipcode)"
            + " WHERE id = :id";
    private static final String SQL_CREATE_CLIENT = "INSERT INTO client (client_name, website_url, phone_number, line_1, " +
            "line_2, line_3, city, state, zipcode)"
            + " VALUES (:client_name, :website_url, :phone_number, :line_1, :line_2, :line_3, :city, :state, :zipcode)";

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Client> listClient() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_CLIENTS, new ClientRowMapper());
    }

    @Override
    public Integer createClient(Client client) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_CLIENT, new BeanPropertySqlParameterSource(client), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Client readClient(Integer clientId) {
        return namedParameterJdbcTemplate.queryForObject(SQL_READ_CLIENT, Collections.singletonMap("client_id", clientId), new ClientRowMapper());
    }

    @Override
    public void updateClient(Client client) {
        namedParameterJdbcTemplate.update(SQL_UPDATE_CLIENT, new BeanPropertySqlParameterSource(client));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deleteClient(Integer clientId) {
        namedParameterJdbcTemplate.update(SQL_DELETE_CLIENT, Collections.singletonMap("client_id", clientId));
    }
    /**
     * Row mapper for client records.
     */
    private static final class ClientRowMapper implements RowMapper<Client> {

        @Override
        public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
            Client client = new Client();
            client.setId(rs.getInt("id"));
            client.setClient_name(rs.getString("client_name"));
            client.setLine_1(rs.getString("line_1"));
            client.setLine_2(rs.getString("line_2"));
            client.setLine_3(rs.getString("line_3"));
            client.setCity(rs.getString("city"));
            client.setState(rs.getString("state"));
            client.setZipcode(rs.getString("zipcode"));
            client.setWebsite_url(rs.getString("website_url"));
            client.setPhone_number(rs.getString("phone_number"));
            return client;
        }
    }
}
