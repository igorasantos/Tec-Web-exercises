package com.imd_tec.a05e06.presenc.q1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Log.i("main-activity", "onCreate");
    }
    @Override
    protected void onStart(){
        super.onStart();
        Log.i("main-activity", "onStart");
    }
    @Override
    protected void onResume(){
        super.onResume();
        Log.i("main-activity", "onResume");
    }
    @Override
    protected void onPause(){
        super.onPause();
        Log.i("main-activity", "onPause");
    }
    @Override
    protected void onStop(){
        super.onStop();
        Log.i("main-activity", "onStop");
    }
    @Override
    protected void onRestart(){
        super.onRestart();
        Log.i("main-activity", "onRestart");
    }
    @Override
    protected void onDestroy(){
        super.onDestroy();
        Log.i("main-activity", "onDestroy");
    }
    protected void convertCelciusToFahrenheit(View v){
    }
}