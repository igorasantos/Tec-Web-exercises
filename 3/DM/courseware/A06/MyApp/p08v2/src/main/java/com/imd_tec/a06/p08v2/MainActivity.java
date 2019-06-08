package com.imd_tec.a06.p08v2;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void chamarActivity(View v){
        Intent acao = new Intent();
        acao.setAction(Intent.ACTION_SEND);
        acao.setType("text/plain");
        acao.putExtra(Intent.EXTRA_TEXT,"Informação textual recebida da actitivy da aplicação anterior...");
        startActivity(acao);
    }
}
