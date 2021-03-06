package com.imd_tec.a06.p12;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button confirmar = findViewById (R.id.act1_bt1);
        Button limpar = findViewById (R.id.act1_bt2);
        Button fechar = findViewById (R.id.act1_bt3);
        Button pensar = findViewById (R.id.act1_bt4);

        final EditText login = findViewById(R.id.txt_login);
        final EditText senha = findViewById(R.id.txt_pass);
        final ImageView imgView = findViewById(R.id.imageView1);

        confirmar.setOnClickListener(new View.OnClickListener() { // rever pq esse `new View.OnClickListener(){`
            @Override
            public void onClick(View v) {
                String loginStr = login.getText().toString();
                String senhaStr = senha.getText().toString();
                if (loginStr != null && loginStr.equals("aluno")) {
                    if (senhaStr != null && senhaStr.equals("aluno")) {
                        //Sucesso
                        imgView.setImageResource(android.R.drawable.presence_online);
                        //Abre nova activity
                        Intent intent = new Intent(getApplicationContext(), HelloActivity.class);
                        intent.putExtra("login",loginStr);
                        startActivity(intent);
                    } else {
                        //Falha senha
                        Toast.makeText(getApplicationContext(), "Senha inválida", Toast.LENGTH_SHORT).show();
                    }
                } else {
                    //Falha login
                    Toast.makeText(getApplicationContext(), "Login inválido", Toast.LENGTH_LONG).show();
                }
            }
        });
        limpar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                login.setText("");
                senha.setText("");
                imgView.setImageResource(android.R.drawable.presence_offline);
            }
        });
        fechar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                abreDialog(v);
            }
        });
        pensar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                abreProgress(v);
            }
        });
    }
    protected void abreDialog(View v) {
        final AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage("Tem certeza que deseja sair?")
                .setCancelable(false)
                .setPositiveButton("Sim", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        MainActivity.this.finish();
                    }
                })
                .setNegativeButton("Não", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                    }
                });
        AlertDialog alert = builder.create();
        alert.show();
    }
    protected void abreProgress(View v) {
        ProgressDialog progressDialog;
        progressDialog = new ProgressDialog(this);
        progressDialog.setTitle("Carregando");
        progressDialog.setMessage("Por favor, aguarde indefinidamente...\nBrinks!\nFeche logo isso! xD");
        progressDialog.setCancelable(true);
        progressDialog.setIndeterminate(true);
        progressDialog.show();
    }
}