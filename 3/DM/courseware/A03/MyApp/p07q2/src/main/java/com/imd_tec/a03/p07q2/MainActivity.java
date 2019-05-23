package com.imd_tec.a03.p07q2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView textoNovo = (TextView) findViewById(R.id.texto);
        textoNovo.setText("Olá Mundo!");
    }
}
