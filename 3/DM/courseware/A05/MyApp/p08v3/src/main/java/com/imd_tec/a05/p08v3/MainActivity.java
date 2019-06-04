package com.imd_tec.a05.p08v3;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import java.io.File;
import java.io.FileInputStream;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void mudarImagem (View view) { //não executou
        try{
            ImageView imgv = (ImageView) findViewById(R.id.imageView2);

            File dir = Environment.getExternalStorageDirectory();
            File arq = new File(dir,"estrutura.png"); //esse cartão tem que estar no cartao de memória
            FileInputStream stream = new FileInputStream(arq);

            Bitmap imagem = BitmapFactory.decodeStream(stream);
            imgv.setImageBitmap(imagem);
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}