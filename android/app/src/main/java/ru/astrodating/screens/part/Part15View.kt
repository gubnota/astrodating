package ru.astrodating.screens.part

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import ru.astrodating.ui.theme.AstrodatingTheme

@Composable
fun Part15View(navController: NavHostController?) {
    var favoriteMusic by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        Text("What is your favorite music?")
        OutlinedTextField(
            value = favoriteMusic,
            onValueChange = { favoriteMusic = it },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp)
        )

        Button(
            onClick = {
                navController?.navigate("part16")
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Next")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Part15ScreenPreview() {
    AstrodatingTheme {
        Part15View(navController = null)
    }
}
