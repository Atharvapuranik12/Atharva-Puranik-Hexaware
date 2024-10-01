package com.AtharvaJava.concreteClasses;

import com.AtharvaJava.abstractClasses.Vehicle;

public class Bike extends Vehicle {
    public Bike(String name, double price) {
        super(name, price);
    }

    @Override
    public void rentVehicle() {
        if (!isRented()) {
            System.out.println(getName() + " bike has been rented for $" + getPrice() + " per day.");
            setRented(true);
        } else {
            System.out.println(getName() + " bike is already rented.");
        }
    }

    @Override
    public void returnVehicle() {
        if (isRented()) {
            System.out.println(getName() + " bike has been returned.");
            setRented(false);
        } else {
            System.out.println(getName() + " bike is not currently rented.");
        }
    }
}
