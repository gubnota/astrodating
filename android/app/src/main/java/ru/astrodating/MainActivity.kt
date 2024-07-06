package ru.astrodating

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview
import dagger.hilt.android.AndroidEntryPoint
import ru.astrodating.ui.theme.AstrodatingTheme

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MainApplication()
        }
    }
}

@Composable
fun MainApplication() {
    AstrodatingTheme {
        NavGraph()
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    MainApplication()
}
