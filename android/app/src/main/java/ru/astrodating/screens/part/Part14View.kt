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
fun Part14View(navController: NavHostController?) {
    var favoriteBooks by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center
    ) {
        Text("What are your favorite books?")
        OutlinedTextField(
            value = favoriteBooks,
            onValueChange = { favoriteBooks = it },
            modifier = Modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp)
        )

        Button(
            onClick = {
                navController?.navigate("part15")
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Next")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun Part14ScreenPreview() {
    AstrodatingTheme {
        Part14View(navController = null)
    }
}
