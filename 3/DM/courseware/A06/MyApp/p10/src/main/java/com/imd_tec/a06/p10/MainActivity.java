package com.imd_tec.a06.p10;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
//        Opção 1 de ação de botão
//        Button chamarActivity = findViewById (R.id.bt1);
//        chamarActivity.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Intent intent = new Intent(Intent.ACTION_SEND);
//                intent.setType("text/plain");
//                startActivity(intent);
//            }
//        });
    }
    //Opção 2 de ação de botão
    public void chamarActivity(View v){
        Intent intent = new Intent(Intent.ACTION_SEND);
        intent.setType("text/plain");
        // descomentar a linha seguinte, para inserir previamente algum conteúdo textual na chamada da activity padrão do android para texto
        // intent.putExtra(Intent.EXTRA_TEXT,"Informação textual recebida da actitivy da aplicação anterior...");
        startActivity(intent);
    }
}