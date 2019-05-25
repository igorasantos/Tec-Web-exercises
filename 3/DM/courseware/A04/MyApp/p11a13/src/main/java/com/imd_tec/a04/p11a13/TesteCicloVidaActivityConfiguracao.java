package com.imd_tec.a04.p11a13;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

public class TesteCicloVidaActivityConfiguracao extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.d("CicloVida","A.onCreate");
        if (savedInstanceState != null) {
            Log.d("CicloVida","[savedInstanceState != null]");
        }
        super.onCreate(savedInstanceState);
        setContentView(R.layout.principal);

        TextView textoNovo = (TextView) findViewById(R.id.texto);
        textoNovo.setText("Teste lendo configs.");

    }
    @Override
    protected void onStart(){
        Log.d("CicloVida","A.onStart");
        super.onStart();
    }
    @Override
    protected void onResume(){
        Log.d("CicloVida","A.onResume");
        super.onResume();
    }
    @Override
    protected void onPause(){
        Log.d("CicloVida","A.onPause");
        super.onPause();
    }
    @Override
    protected void onStop(){
        Log.d("CicloVida","A.onStop");
        super.onStop();
    }
    @Override
    protected void onRestart(){
        Log.d("CicloVida","A.onRestart");
        super.onRestart();
    }
    @Override
    protected void onDestroy(){
        Log.d("CicloVida","A.onDestroy");
        super.onDestroy();
    }
    @Override
    protected void onSaveInstanceState(Bundle outState){
        Log.d("CicloVida","A.onSaveInstanceState");
        super.onSaveInstanceState(outState);
    }

    public void chamarOutraActivity(View v) {
        Intent intent = new Intent(this,OutraActivity.class);
        startActivity(intent);
    }
}
