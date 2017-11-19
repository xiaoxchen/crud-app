INSERT INTO client (
    client_name,
    website_url,
    phone_number,
    line_1,
    line_2,
    line_3,
    city,
    state,
    zipcode
) VALUES (
    'ClientA',
    'http://www.baidu.com',
    '8571111111',
    '123 Any St.',
    '',
    '',
    'Asheville',
    'NC',
    '28801'
), (
    'ClientB',
    'http://www.baidu.com',
    '8571111111',
    '123 Any St.',
    '',
    '',
    'Asheville',
    'NC',
    '28801'
);
INSERT INTO person (
    first_name,
    last_name,
    email_address,
    street_address,
    city,
    state,
    zip_code,
    client_id
) VALUES (
    'John',
    'Smith',
    'fake1@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    '1'
), (
    'Jane',
    'Smith',
    'fa2@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    '2'
);
INSERT INTO person (
    first_name,
    last_name,
    email_address,
    street_address,
    city,
    state,
    zip_code
) VALUES (
    'John',
    'Smith',
    'fake1@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801'
);