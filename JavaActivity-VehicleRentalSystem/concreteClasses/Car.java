package com.AtharvaJava.concreteClasses;

import com.AtharvaJava.abstractClasses.*;

public class Car extends Vehicle {
    public Car(String name, double price) {
        super(name, price);
    }

    @Override
    public void rentVehicle() {
        if (!isRented()) {
            System.out.println(getName() + " has been rented for $" + getPrice() + " per day.");
            setRented(true);
        } else {
            System.out.println(getName() + " is already rented.");
        }
    }

    @Override
    public void returnVehicle() {
        if (isRented()) {
            System.out.println(getName() + " has been returned.");
            setRented(false);
        } else {
            System.out.println(getName() + " is not currently rented.");
        }
    }
}
