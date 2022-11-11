package com.example.librarysystem;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class loginpage extends AppCompatActivity {

    TextView loginText;
    TextView nameText;
    TextView passwordText;
    RadioGroup access;
    RadioButton user;
    RadioButton admin;
    EditText spaceName;
    EditText spacePassword;
    Button enter;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loginpage);

        user = findViewById(R.id.radioButtonUser);
        admin = findViewById(R.id.radioButtonAdmin);
        loginText = findViewById(R.id.loginText);
        loginText.setText("LOGIN");
        nameText = findViewById(R.id.nameText);
        nameText.setText("Name:");
        passwordText = findViewById(R.id.passwordText);
        passwordText.setText("Password:");
        access = findViewById(R.id.access);
        spaceName=findViewById(R.id.spaceName);
        spacePassword=findViewById(R.id.spacePassword);
        enter=findViewById(R.id.enter);


    }

}