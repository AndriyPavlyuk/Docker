package it.discovery.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Table
@Entity
@Getter
@Setter
public class Product {
	
	@Id
	@GeneratedValue
	private Integer id;
	
	private String name;

}
