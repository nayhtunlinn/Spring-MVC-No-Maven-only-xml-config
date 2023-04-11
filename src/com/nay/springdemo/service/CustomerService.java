package com.nay.springdemo.service;

import java.util.List;

import com.nay.springdemo.entity.Customer;

public interface CustomerService {

	public List<Customer> getCustomers();
	
	public List<Customer> getCustomers(int theSortField);
	
	public void saveCustomer(Customer customer);

	public Customer getCustomer(int id);

	public void delete(int id);

	public List<Customer> searchCustomers(String theSearchName);
}
