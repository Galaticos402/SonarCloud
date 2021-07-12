/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author RiceShower
 */
public class OrderSaleDTO extends OrderDTO implements Serializable {

    private String address;
    private String phoneNumber;
    private String fullname;

    public OrderSaleDTO() {
    }

    public OrderSaleDTO(String address, String phoneNumber, String fullname, int id, String customerEmail, String status, String saleEmail, Date completeDate, double totalPrice) {
        super(id, customerEmail, status, saleEmail, completeDate, totalPrice);
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    
}
