package com.imd_tec.a06.p10v3;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Toast;

import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void existingActivityNonTreatedCall(View v){
        Intent acao = new Intent();
        acao.setAction(Intent.ACTION_SEND);
        acao.setType("text/plain");
        acao.putExtra(Intent.EXTRA_TEXT,"Informação textual recebida da actitivy da aplicação anterior...");
        startActivity(acao);
    }
    public void nonExistingActivityNonTreatedCall(View v){
        Intent acao = new Intent();
        acao.setAction("XXX");
        startActivity(acao);
    }
    public void existingActivityTreatedCall(View v){
        Intent acao = new Intent();
        acao.setAction(Intent.ACTION_SEND);
        acao.setType("text/plain");
        acao.putExtra(Intent.EXTRA_TEXT,"Informação textual recebida da actitivy da aplicação anterior...");

        List list = getPackageManager().queryIntentActivities(acao, PackageManager.MATCH_DEFAULT_ONLY);
        if (!list.isEmpty()){
            startActivity(acao);
        } else {
            Toast.makeText(getApplicationContext(), "Activity inexistente!", Toast.LENGTH_SHORT).show();
        }
    }
    public void nonExistingActivityTreatedCall(View v){
        Intent acao = new Intent();
        acao.setAction("XXX");

        List list = getPackageManager().queryIntentActivities(acao, PackageManager.MATCH_DEFAULT_ONLY);
        if (!list.isEmpty()) {
            startActivity(acao);
        } else {
            Toast.makeText(getApplicationContext(), "Activity inexistente!", Toast.LENGTH_SHORT).show();
        }
    }

}
