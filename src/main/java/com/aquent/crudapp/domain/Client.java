package com.aquent.crudapp.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


/**
 * The Client entity corresponding to the "client" table in the database.
 */
public class Client {
    private Integer id;

    public Integer getId() {
        return id;
    }
    @NotNull
    @Size(min = 1, max = 50, message = "Client name is required with maximum length of 50")
    private String client_name;
    @NotNull
    @Pattern(regexp = "^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]",
            message = "Please input valid URL")
    private String website_url;
    @NotNull
    @Pattern(regexp = "(\\+?([0-9]{1,3}))?([ ]?)\\(?([0-9]{3})\\)?([ .-]?)([0-9]{3})([ .-]?)([0-9]{4})",
            message = "Please input valid phone number")
    private String phone_number;
    @NotNull
    @Size(min = 1, max = 255, message = "Address 1 is required with maximum length of 255")
    private String line_1;
    private String line_2;
    private String line_3;
    @NotNull
    @Size(min = 1, max = 50, message = "City is required with maximum length of 50")
    private String city;
    @NotNull
    @Pattern(regexp = "[A-Z]{2}", message = "State is required two uppercase characters")
    private String state;
    @NotNull
    @Pattern(regexp = "[0-9]{5}", message = "Please input valid zipcode")
    private String zipcode;

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClient_name() {
        return client_name;
    }

    public void setClient_name(String client_name) {
        this.client_name = client_name;
    }

    public String getWebsite_url() {
        return website_url;
    }

    public void setWebsite_url(String website_url) {
        this.website_url = website_url;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getLine_1() {
        return line_1;
    }

    public void setLine_1(String line_1) {
        this.line_1 = line_1;
    }

    public String getLine_2() {
        return line_2;
    }

    public void setLine_2(String line_2) {
        this.line_2 = line_2;
    }

    public String getLine_3() {
        return line_3;
    }

    public void setLine_3(String line_3) {
        this.line_3 = line_3;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
}
