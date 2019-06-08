package com.imd_tec.a06.p03;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button discar = findViewById (R.id.bt1);

        final EditText inputNumeroDiscar = findViewById(R.id.txtInput1);

        discar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String numDiscar = inputNumeroDiscar.getText().toString();

                Intent intent = new Intent(Intent.ACTION_DIAL);
                intent.setData(Uri.parse("tel:" + numDiscar));
                startActivity(intent);
            }
        });
    }
}
