package com.example.librarysystem;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import org.w3c.dom.Text;

public class MainActivity extends AppCompatActivity {

TextView title;
Button login;
TextView find;
EditText space;
Button search;


    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        title =findViewById(R.id.textView);
        title.setText("LIBRARY");
        login=findViewById(R.id.login);
        space =findViewById(R.id.editText);
        find=findViewById(R.id.textView1);
        find.setText("Find books");
        search=findViewById(R.id.search);

    }
    public void onLoginCilcked(View view){


    }
    public void onSearchClicked(View view){

    }
}