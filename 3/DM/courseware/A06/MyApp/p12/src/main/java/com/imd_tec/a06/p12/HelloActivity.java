package com.imd_tec.a06.p12;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.imd_tec.a06.model.User;

public class HelloActivity extends AppCompatActivity {
    private User userN;
    private TextView txtWelcome;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hello);
        // final String userName = getIntent().getStringExtra("login");
        // https://stackoverflow.com/a/9679336
        userN = new User();
        userN.setUserName(getIntent().getStringExtra("login"));
        txtWelcome = findViewById(R.id.act2_txt2);
        txtWelcome.setText("Bem-vindo(a), "+userN.getUserName());

        Button btEdit = findViewById (R.id.act2_bt1);
        btEdit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                activityCall(v);
            }
        });
    }
    public void activityCall(View v){
        Intent intent = new Intent(HelloActivity.this,EditNameActivity.class);
        intent.putExtra("nomeEdit",userN.getUserName());
        startActivityForResult(intent,1);
    }
    // https://github.com/guru24x7/StartActivityForResult/blob/6263370e5c0eb903ce2d7d975eea5463ec9004f4/app/src/main/java/com/example/saqib/startactivityforresult/MainActivity.java
    // https://stackoverflow.com/questions/10407159/how-to-manage-startactivityforresult-on-android
    // https://developer.android.com/training/basics/intents/result#ReceiveResult
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 1) {
            if (resultCode == AppCompatActivity.RESULT_OK) {
                // sucesso
                String resultTxt = data.getExtras().getString("MSG");
                if (!resultTxt.equals("")) {
                    userN.setUserName(resultTxt);
                    txtWelcome.setText("Bem-vindo(a), "+userN.getUserName());
                    Toast.makeText(getApplicationContext(), "Edição realizada.", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(getApplicationContext(), "Edição vazia. Nome não alterado", Toast.LENGTH_LONG).show();
                }
            } else if (resultCode == AppCompatActivity.RESULT_CANCELED) {
                // erro
                Toast.makeText(getApplicationContext(), "Ocorreu um erro ou a edição foi cancelada. Tente novamente.", Toast.LENGTH_LONG).show();
            }
        }
    }
}