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
fun Part16View(navController: NavHostController?) {
    var additionalInfo by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        Text("Any additional information?")
        OutlinedTextField(
            value = additionalInfo,
            onValueChange = { additionalInfo = it },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp)
        )

        Button(
            onClick = {
                // Handle final submission or next action
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Finish")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Part16ScreenPreview() {
    AstrodatingTheme {
        Part16View(navController = null)
    }
}
