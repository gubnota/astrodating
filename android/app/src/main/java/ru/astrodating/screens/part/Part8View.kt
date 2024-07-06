package ru.astrodating.screens.part

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import ru.astrodating.ui.theme.AstrodatingTheme

@Composable
fun Part8View(navController: NavHostController?) {
    var assistance by remember { mutableStateOf("") }
    var ageRange by remember { mutableStateOf(18.0..30.0) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        Text("What kind of assistance are you looking for?")
        OutlinedTextField(
            value = assistance,
            onValueChange = { assistance = it },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp)
        )

        Text("Desired age range for a partner")

        // Implement age range slider or picker here

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = {
                navController?.navigate("part9")
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Next")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Part8ScreenPreview() {
    AstrodatingTheme {
        Part8View(navController = null)
    }
}
