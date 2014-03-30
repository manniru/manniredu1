package com.mannir.snippets;

public class Person {
	private String name;
	private int age;
	public Person() {
		setName("A N Other");
		setAge(21);
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setAge(int age) {
		this.age = age;
}
	public int getAge() {
		return age;
	}
}