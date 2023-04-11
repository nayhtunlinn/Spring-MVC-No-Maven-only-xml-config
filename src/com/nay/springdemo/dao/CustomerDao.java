package com.nay.springdemo.dao;

import java.util.List;

import com.nay.springdemo.entity.Customer;

public interface CustomerDao {
	
	public List<Customer> getCustomers();
	
	public void saveCustomer(Customer customer);

	public Customer getCustomer(int id);

	public void delete(int id);
	
	public List<Customer> searchCustomers(String theSearchName);
	
	public List<Customer> getCustomers(int theSortField);

}
