package com.example.librarysystem;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class search extends AppCompatActivity {
    String search;
    EditText searchBar;
    Button searchButton, borrow;
    TextView name,author,year, availability;
    @SuppressLint("MissingInflatedId")
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.search);
        //search=getIntent().getStringExtra("search",null);
        searchBar=findViewById(R.id.searchEdit);
        searchButton=findViewById(R.id.searchButton);
        borrow=findViewById(R.id.borrow);
        name=findViewById(R.id.nameText);
        author=findViewById(R.id.author);
        year=findViewById(R.id.year);
        availability=findViewById(R.id.availability);

    }
}
