package com.imd_tec.a04.p11a13;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

public class OutraActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d("CicloVida","B.onCreate");
        setContentView(R.layout.main2);
        //adicionarEventoBotao();
    }
    public void voltar(View v) {
        finish();
    }
    @Override
    protected void onStart(){
        Log.d("CicloVida","B.onStart");
        super.onStart();
    }
    @Override
    protected void onResume(){
        Log.d("CicloVida","B.onResume");
        super.onResume();
    }
    @Override
    protected void onPause(){
        Log.d("CicloVida","B.onPause");
        super.onPause();
    }
    @Override
    protected void onStop(){
        Log.d("CicloVida","B.onStop");
        super.onStop();
    }
    @Override
    protected void onRestart(){
        Log.d("CicloVida","B.onRestart");
        super.onRestart();
    }
    @Override
    protected void onDestroy(){
        Log.d("CicloVida","B.onDestroy");
        super.onDestroy();
    }
}
