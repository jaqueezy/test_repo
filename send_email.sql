DECLARE
    c NUMBER;
BEGIN
    c := pp_send_mail
    (
        'mkelley@pwrplan.com',
        'pwrplant',
        'pwrplant',
        'I Am Your Real Boss',
        'Do my work instead of Dennis''.',
        'matthew.kelley@powerplan.com',
        'powerplan-com.mail.protection.outlook.com',
        ' '
    );
END;
/
----
--need to take out the commit in the function for this to work
SELECT pp_send_mail
    (
        'dbrimeyer@pwrplan.com',
        'pwrplant',
        'pwrplant',
        'Hi',
        'Sam',
        'scamacho@pwrplan.com',
        'mail.pwrplan.com',
        ' '
    )
FROM dual
;

SELECT wo('10042316')
FROM work_order_control
;

SELECT pp_send_mail
    (
        'work_orders@pwrplan.com',
        'pwrplant',
        'pwrplant',
        'Work Order Type Created',
        'The work order type, ' || (SELECT * FROM dual) || ', with ID, ' || (SELECT * FROM dual) || ', does not have a Repair Test assigned to it. ' ||
        'Please review and assign a Repair Test.',
        'eberger@pwrplan.com',
        'mail.pwrplan.com',
        ' '
    )
FROM dual
;

SELECT pp_send_mail
    (
        'work_orders@pwrplan.com',
        'pwrplant',
        'pwrplant',
        'Work Order Type Created',
        'This list: ' || (SELECT Max(description) FROM work_order_type),
        'matthew.kelley@powerplan.com',
        'powerplan-com.mail.protection.outlook.com',
        ' '
    )
FROM work_order_type
;

SELECT *
FROM work_order_type
WHERE tax_expense_test_id IS NULL
;

SELECT *
FROM wo_validation_control
;