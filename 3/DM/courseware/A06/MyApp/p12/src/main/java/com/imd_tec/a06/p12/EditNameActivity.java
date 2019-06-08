package com.imd_tec.a06.p12;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class EditNameActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_name);

        String nomeAnterior = getIntent().getStringExtra("nomeEdit");

        EditText campoNomeAnterior = findViewById(R.id.campo_nome_anterior);
        campoNomeAnterior.setText(nomeAnterior);

        final EditText campoNomeNovo = findViewById(R.id.campo_novo_nome);

        Button btMudar = findViewById (R.id.act3_bt1);
        // https://github.com/guru24x7/StartActivityForResult/blob/6263370e5c0eb903ce2d7d975eea5463ec9004f4/app/src/main/java/com/example/saqib/startactivityforresult/SecondActivity.java
        // http://steveliles.github.io/returning_a_result_from_an_android_activity.html
        // https://stackoverflow.com/questions/22553672/android-startactivityforresult-setresult-for-a-view-class-and-an-activity-cla
        btMudar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String novoNome = campoNomeNovo.getText().toString();
                Intent intent = new Intent();
                intent.putExtra("MSG",novoNome);
                setResult(AppCompatActivity.RESULT_OK,intent);
//                EditNameActivity.this.finish();
                finish();
            }
        });
    }
}