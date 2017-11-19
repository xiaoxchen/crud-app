package com.aquent.crudapp.domain;

import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
public class Client {
    private Integer id;
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
}
