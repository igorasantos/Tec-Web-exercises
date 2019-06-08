package com.imd_tec.a06.p11;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

public class HelloActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hello);

        String name = getIntent().getStringExtra("login");
        TextView txtWelcome = findViewById(R.id.act2_txt2);

        txtWelcome.setText("Bem-vindo(a), "+name);

    }
}
